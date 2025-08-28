# ZSH + Autosuggestions Installer

Автоматический установщик и настройщик zsh с плагином autosuggestions для Ubuntu/Debian и macOS систем.

Репозиторий: https://gitverse.ru/mibazarow/bash-to-zsh-switcher

## 🚀 Быстрый старт

### Ubuntu/Debian

```bash
# Скачать и запустить
curl -fsSL https://gitverse.ru/mibazarow/bash-to-zsh-switcher/raw/branch/main/install-ubuntu.sh | bash

# Или клонировать и запустить локально
git clone https://gitverse.ru/mibazarow/bash-to-zsh-switcher.git
cd bash-to-zsh-switcher
./install-ubuntu.sh
```

### macOS

```bash
# Скачать и запустить
curl -fsSL https://gitverse.ru/mibazarow/bash-to-zsh-switcher/raw/branch/main/install-macos.sh | bash

# Или клонировать и запустить локально
git clone https://gitverse.ru/mibazarow/bash-to-zsh-switcher.git
cd bash-to-zsh-switcher
./install-macos.sh
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

## 📁 Структура проекта

```
bash-to-zsh-switcher/
├── install-ubuntu.sh          # Установщик для Ubuntu/Debian
├── install-macos.sh           # Установщик для macOS
├── uninstall-ubuntu.sh        # Скрипт отката для Ubuntu/Debian
├── uninstall-macos.sh         # Скрипт отката для macOS
├── test-ubuntu.sh             # Тестирование конфигурации для Ubuntu/Debian
├── test-macos.sh              # Тестирование конфигурации для macOS
├── README.md                  # Эта документация
├── EXAMPLES.md                # Примеры использования
│
├── ubuntu-switcher/           # Скрипты для Ubuntu/Debian
│   ├── install.sh             # Основной установщик 
│   ├── uninstall.sh           # Скрипт отката
│   └── test.sh                # Тестирование конфигурации
│
└── macos-switcher/            # Скрипты для macOS
    ├── install.sh             # Основной установщик
    ├── uninstall.sh           # Скрипт отката
    └── test.sh                # Тестирование конфигурации
```

## 🔄 Активация

После установки:

1. **Перезагрузка** (рекомендуется)
2. **Logout/Login**
3. **Ручной запуск**: `exec zsh`

## 🛠️ Откат к bash

Если что-то пошло не так:

### Ubuntu/Debian

```bash
# Использовать скрипт отката
./uninstall-ubuntu.sh
```

### macOS

```bash
# Использовать скрипт отката
./uninstall-macos.sh
```

## 📂 Резервные копии

Скрипт автоматически создает:
- `~/.zshrc.backup.YYYYMMDD_HHMMSS` - резервная копия zsh конфига
- Оригинальные bash файлы остаются нетронутыми

## 🧪 Тестирование конфигурации

После установки вы можете протестировать правильность конфигурации:

### Ubuntu/Debian

```bash
./test-ubuntu.sh
```

### macOS

```bash
./test-macos.sh
```

## 🐛 Решение проблем

### Проблема: autosuggestions не работают

```bash
# Проверить установку
ls ~/.zsh/zsh-autosuggestions/

# Переустановить
rm -rf ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# Перезагрузить конфигурацию
source ~/.zshrc
```

## 📄 Дополнительная документация

Подробные примеры использования и решения типичных проблем см. в файле [EXAMPLES.md](EXAMPLES.md).
