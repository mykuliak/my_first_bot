# coding: UTF-8

require 'telegram/bot'

TOKEN = '1096089747:AAExTgLPs3n6rQCWeAWkgoGNXU-4YsSPsYI'

ANSWERS = [
    "Безперечно",
    "Ніяких сумнівів",
    "Безумовно так",
    "Можеш бути впевнений в цьому",

    "Мені здається - <<так>>",
    "Швидше за все",
    "Хороші перспективи",
    "Знаки говорять - <<так>> ",
    "Так",

    "Поки не зрозміло, спробуй знову",
    "Запитай пізніше",
    "Краще не розповідати",
    "Зараз не можна передбачити",
    "Сконцентруйся і запитай знову",

    "Навіть не думай",
    "Моя відповідь - <<ні>> ",
    "За моїми даними - <<ні>> ",
    "Перспективи не дуже хороші",
    "Вельми сумнівно"
]
Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start', '/start start'
      bot.api.send_message(
          chat_id: message.chat.id,
          text: "Привіт, #{message.from.first_name}")
    else
      bot.api.send_message(
          chat_id: message.chat.id,
          text: ANSWERS.sample)
    end
  end
end