# ZSH + Autosuggestions Installer

Автоматический установщик и настройщик zsh с плагином autosuggestions для Ubuntu/Debian систем.

## 🚀 Быстрый старт

```bash
# Скачать и запустить
curl -fsSL https://raw.githubusercontent.com/username/repo/main/install-zsh-autosuggestions.sh | bash

# Или клонировать и запустить локально
git clone <this-repo>
cd bash-zsh-switcher
./install-zsh-autosuggestions.sh
```

## 📋 Что делает скрипт

- ✅ Устанавливает zsh (если не установлен)
- ✅ Устанавливает git (если не установлен) 
- ✅ Клонирует [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- ✅ Создает резервные копии существующих конфигураций
- ✅ Мигрирует все настройки из bash в zsh:
  - Android SDK пути
  - Flutter настройки
  - Cargo environment
  - Все aliases
  - PATH конфигурации
- ✅ Настраивает красивый цветной prompt
- ✅ Изменяет оболочку по умолчанию на zsh
- ✅ Автоматически определяет инструменты разработки

## 🔧 Функции

### Автодополнения
- Умные подсказки на основе истории команд
- Серая подсветка предлагаемых команд
- Нажмите `→` для принятия предложения

### Aliases
```bash
ll, la, l          # Варианты ls
gs, ga, gc, gp     # Git shortcuts  
.., ..., ....      # Навигация вверх
h, j, which        # Утилиты
```

### Автоопределение инструментов
- Flutter SDK
- Android SDK
- Node.js tools
- Cargo (Rust)

## 📁 Структура файлов

```
bash-zsh-switcher/
├── install-zsh-autosuggestions.sh  # Основной установщик
├── README.md                       # Эта документация
├── uninstall.sh                    # Скрипт отката
└── test-config.sh                  # Тестирование конфигурации
```

## 🔄 Активация

После установки:

1. **Перезагрузка** (рекомендуется)
2. **Logout/Login**
3. **Ручной запуск**: `exec zsh`

## 🛠️ Откат к bash

Если что-то пошло не так:

```bash
# Вернуть bash как оболочку по умолчанию
sudo chsh -s /bin/bash $USER

# Или использовать скрипт отката
./uninstall.sh
```

## 📂 Резервные копии

Скрипт автоматически создает:
- `~/.zshrc.backup.YYYYMMDD_HHMMSS` - резервная копия zsh конфига
- Оригинальные bash файлы остаются нетронутыми

## 🐛 Решение проблем

### Проблема: autosuggestions не работают
```bash
# Проверить установку
ls ~/.zsh/zsh-autosuggestions/

# Переустановить
rm -rf ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
```

### Проблема: Flutter/Android не найдены
```bash
# Проверить пути
echo $ANDROID_HOME
which flutter

# Добавить в ~/.zsh_local
echo 'export ANDROID_HOME=/path/to/sdk' >> ~/.zsh_local
```

## 🎨 Кастомизация

Для дополнительных настроек создайте `~/.zsh_local`:

```bash
# Пример ~/.zsh_local
export MY_CUSTOM_VAR="value"
alias my_alias="command"

# Изменить стиль autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bold"
```

## 📊 Системные требования

- Ubuntu 18.04+ / Debian 10+
- sudo права
- Интернет соединение
- ~50MB свободного места

## 🔗 Полезные ссылки

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [Zsh Documentation](http://zsh.sourceforge.net/Doc/)
- [Oh My Zsh](https://ohmyz.sh/) - альтернативный фреймворк
