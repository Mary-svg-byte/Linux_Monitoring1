# Создайте словарь для установления соответствия значений
соответствие = {}

# Ваш входной массив значений
входной_массив = [значение1, значение2, значение3]

# Ваши соответствующие значения
соответствующие_значения = [соответствие1, соответствие2, соответствие3]

# Заполните словарь соответствия
for i in range(len(входной_массив)):
    соответствие[входной_массив[i]] = соответствующие_значения[i]

# Теперь у вас есть словарь, который позволяет вам получать соответствующее значение по входному значению
значение = входной_массив[0]
соответствие_значения = соответствие[значение]

# В соответствие_значения будет сохранено соответствующее значение для входного значения
