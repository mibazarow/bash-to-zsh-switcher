# 📝 Примеры использования

## 🚀 Быстрая установка

```bash
# Переходим в директорию проекта
cd bash-zsh-switcher

# Запускаем установку
./install-zsh-autosuggestions.sh

# После установки перезагружаемся или запускаем
exec zsh
```

## 🧪 Тестирование конфигурации

```bash
# Проверить что все работает
./test-config.sh

# Если есть проблемы, посмотреть детали
zsh -c "source ~/.zshrc" || echo "Ошибка в конфигурации"
```

## 🔄 Откат к bash

```bash
# Быстрый откат
sudo chsh -s /bin/bash $USER

# Или полный откат с очисткой
./uninstall.sh
```

## 🎯 Практические примеры

### Автодополнения в действии

```bash
# Введите начало команды:
fls              # → flutter packages get
gi               # → git init
andro            # → android-studio
npm i            # → npm install
```

### Полезные aliases

```bash
ll               # подробный список файлов
gs               # git status  
ga .             # git add .
gc "message"     # git commit -m "message"
..               # cd ..
...              # cd ../..
```

### Навигация и история

```bash
# Умная навигация
Documents/Flutter   # автодополнение папок
cd And<TAB>         # завершение до Android/

# История команд
flutter<UP>         # найти последние flutter команды
git<CTRL+R>         # поиск в истории
```

## 🛠️ Кастомизация

### Добавить свои настройки

```bash
# Создать файл локальных настроек
nano ~/.zsh_local

# Добавить например:
export MY_PROJECT_PATH="/home/user/projects"
alias pp="cd $MY_PROJECT_PATH"
alias code="code-insiders"

# Изменить стиль подсказок
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bold"
```

### Настройка для VS Code

```json
// В settings.json
{
    "terminal.integrated.defaultProfile.linux": "zsh",
    "terminal.integrated.profiles.linux": {
        "zsh": {
            "path": "/usr/bin/zsh",
            "args": ["-l"]
        }
    }
}
```

## 🐛 Решение проблем

### Autosuggestions не работают

```bash
# Проверить установку
ls ~/.zsh/zsh-autosuggestions/

# Переустановить
rm -rf ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# Перезагрузить конфигурацию
source ~/.zshrc
```

### Flutter не найден

```bash
# Проверить PATH
echo $PATH | grep flutter

# Добавить вручную в ~/.zsh_local
echo 'export PATH=$PATH:/snap/bin' >> ~/.zsh_local
```

### Медленная загрузка zsh

```bash
# Профилирование загрузки
zsh -xvs < /dev/null

# Отключить ненужные плагины
# Закомментировать строки в ~/.zshrc
```

### Конфликт с bash скриптами

```bash
# Запустить bash скрипт явно
bash script.sh

# Или добавить шебанг в скрипт
#!/bin/bash
```

## 📊 Мониторинг производительности

```bash
# Время загрузки zsh
time zsh -i -c exit

# Анализ автодополнений
zsh -c '_zsh_autosuggest_check_completion_length'

# Размер истории
wc -l ~/.zsh_history
```

## 🚀 Дополнительные плагины

После базовой установки можно добавить:

### zsh-syntax-highlighting

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
echo 'source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc
```

### zsh-history-substring-search

```bash
git clone https://github.com/zsh-users/zsh-history-substring-search ~/.zsh/zsh-history-substring-search
echo 'source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh' >> ~/.zshrc
```

## 📱 Мобильная разработка

### Flutter команды с автодополнением

```bash
flutter create my_app<TAB>    # автодополнение опций
flutter build apk --<TAB>     # показать все флаги
flutter packages <TAB>        # pub команды
```

### Android SDK

```bash
sdkmanager --list             # список пакетов
avdmanager list avd           # список эмуляторов
adb devices                   # подключенные устройства
```

---

💡 **Совет**: Первые дни печатайте команды полностью, чтобы зsh "запомнил" их для автодополнений!
