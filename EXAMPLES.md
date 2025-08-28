# 📝 Примеры использования

## 🚀 Быстрая установка

### Ubuntu/Debian

```bash
# Переходим в директорию проекта
cd bash-to-zsh-switcher

# Запускаем установку
./install-ubuntu.sh

# После установки перезагружаемся или запускаем
exec zsh
```

### macOS

```bash
# Переходим в директорию проекта
cd bash-to-zsh-switcher

# Запускаем установку
./install-macos.sh

# После установки перезагружаемся или запускаем
exec zsh
```

## 🧪 Тестирование конфигурации

### Ubuntu/Debian

```bash
# Проверить что все работает
./test-ubuntu.sh

# Если есть проблемы, посмотреть детали
zsh -c "source ~/.zshrc" || echo "Ошибка в конфигурации"
```

### macOS

```bash
# Проверить что все работает
./test-macos.sh

# Если есть проблемы, посмотреть детали
zsh -c "source ~/.zshrc" || echo "Ошибка в конфигурации"
```

## 🔄 Откат к bash

### Ubuntu/Debian

```bash
# Быстрый откат
./uninstall-ubuntu.sh
```

### macOS

```bash
# Быстрый откат
./uninstall-macos.sh
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

#### Ubuntu/Debian

```bash
# Проверить PATH
echo $PATH | grep flutter

# Добавить вручную в ~/.zsh_local
echo 'export PATH=$PATH:/snap/bin' >> ~/.zsh_local
```

#### macOS

```bash
# Проверить PATH
echo $PATH | grep flutter

# Добавить вручную в ~/.zsh_local
echo 'export PATH=$PATH:~/flutter/bin' >> ~/.zsh_local

# Или для Homebrew установки
echo 'export PATH=$PATH:$(brew --prefix)/opt/flutter/bin' >> ~/.zsh_local
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

## 🧰 Системные различия

### Ubuntu/Debian особенности

```bash
# Использует apt для установки пакетов
sudo apt install zsh git

# Пути по умолчанию
Android SDK: ~/Android/Sdk
Flutter: /snap/bin/flutter (если установлен через snap)
```

### macOS особенности

```bash
# Использует Homebrew для установки пакетов
brew install zsh git

# Пути по умолчанию
Android SDK: ~/Library/Android/sdk
Flutter: /opt/homebrew/opt/flutter/bin (если установлен через Homebrew)
Xcode: /Applications/Xcode.app
```

## 🔧 macOS-специфичные настройки

### Интеграция с Homebrew

```bash
# Добавить в ~/.zsh_local для поддержки Homebrew Cask 
echo 'alias brewup="brew update && brew upgrade && brew cleanup"' >> ~/.zsh_local
echo 'alias cask="brew cask"' >> ~/.zsh_local
```

### Intelli J IDEA / Android Studio интеграция

```bash
# Добавить в ~/.zsh_local для поддержки утилит JetBrains
if [[ -d "/Applications/IntelliJ IDEA.app" ]]; then
    echo 'alias idea="open -a 'IntelliJ IDEA'"' >> ~/.zsh_local
fi
if [[ -d "/Applications/Android Studio.app" ]]; then
    echo 'alias studio="open -a 'Android Studio'"' >> ~/.zsh_local
fi
```

### Интеграция с iTerm2

Если вы используете iTerm2, добавьте в ~/.zsh_local:

```bash
# Улучшения для iTerm2
if [[ $TERM_PROGRAM == "iTerm.app" ]]; then
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi
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

💡 **Совет**: Первые дни печатайте команды полностью, чтобы zsh "запомнил" их для автодополнений!
