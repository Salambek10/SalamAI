from aiogram import Bot, Dispatcher, types, executor
import random

TOKEN = 'ТВОЙ_ТОКЕН_ОТ_BOTFATHER'

bot = Bot(token=TOKEN)
dp = Dispatcher(bot)

# Список идей
ideas = [
    "Запустить магазин цифровых продуктов",
    "Создать сервис микрокурсов по обучению",
    "Открыть агентство по автоматизации бизнеса нейросетями",
    "Платформа для персональных консультаций через чат",
    "Создать клуб подписки с закрытым контентом"
]

# Список советов
advices = [
    "Фокусируйся на одной задаче в день — и результаты придут быстрее.",
    "Не бойся тестировать идеи: провал — это тоже результат.",
    "Прокачивай навыки общения — это ключ к любому бизнесу.",
    "Инвестируй в личный бренд: в будущем это даст большие дивиденды.",
    "Автоматизируй всё, что повторяется больше трёх раз."
]

# Команда /start
@dp.message_handler(commands=['start'])
async def start_handler(message: types.Message):
    text = ("Привет! Я твой сервис-бот.\n\n"
            "Вот что я умею:\n"
            "/idea — придумаю бизнес-идею\n"
            "/advice — дам полезный совет\n"
            "/checktext — помогу привести текст в порядок\n\n"
            "Просто напиши мне что-нибудь!")
    await message.answer(text)

# Команда /idea
@dp.message_handler(commands=['idea'])
async def idea_handler(message: types.Message):
    idea = random.choice(ideas)
    await message.answer(f"Вот идея для тебя: {idea}")

# Команда /advice
@dp.message_handler(commands=['advice'])
async def advice_handler(message: types.Message):
    advice = random.choice(advices)
    await message.answer(f"Совет: {advice}")

# Команда /checktext
@dp.message_handler(commands=['checktext'])
async def checktext_handler(message: types.Message):
    await message.answer("Отправь мне текст, который нужно привести в порядок.")

# Обработка текстов
@dp.message_handler(content_types=types.ContentType.TEXT)
async def text_handler(message: types.Message):
    user_text = message.text

    # Обработка простая: исправляем грубые ошибки заглавными буквами + убираем лишние пробелы
    processed_text = ' '.join(user_text.strip().split()).capitalize()

    await message.answer(f"Вот исправленный текст:\n{processed_text}")

if __name__ == '__main__':
    executor.start_polling(dp)

8193921027:AAH4jH_Y4StuEMeJH7gzT6nXZ0HoLtdsWJ8