require 'rest-client'
require 'json'

# Service responsável pela conexão com a api para conversão de moedas
class ExchangeService
  def initialize(source_currency, target_currency, amount)
    @source_currency = source_currency
    @target_currency = target_currency
    @amount = amount.to_f
  end

  def perform
    begin
      exchange_api_url = Rails.application.credentials[Rails.env.to_sym][:currency_api_url]
      exchange_api_key = Rails.application.credentials[Rails.env.to_sym][:currency_api_key]
      request_url = "#{exchange_api_url}?token=#{exchange_api_key}&currency=#{@source_currency}/#{@target_currency}"
      request_result = RestClient.get request_url
      # retorna a taxa de conversão entre as moedas
      value = JSON.parse(request_result.body)['currency'][0]['value'].to_f
      # retorna o valor convertido usando a taxa de conversão
      value * @amount
    # trata os casos de erro
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end