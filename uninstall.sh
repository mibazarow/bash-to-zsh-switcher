#!/bin/bash

# =============================================================================
# ZSH Uninstaller Script
# =============================================================================
# Возврат к bash оболочке и удаление zsh конфигураций
# 
# Использование: ./uninstall.sh
# =============================================================================

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_status "🔄 Начинаем откат к bash..."

# Check if running as root
if [[ $EUID -eq 0 ]]; then
    print_error "Не запускайте этот скрипт от имени root!"
    exit 1
fi

# 1. Change shell back to bash
print_status "Возвращаем bash как оболочку по умолчанию..."
sudo chsh -s /bin/bash $USER
print_success "Оболочка изменена на bash"

# 2. Backup current zsh config
if [[ -f ~/.zshrc ]]; then
    print_status "Создаем резервную копию текущего .zshrc..."
    mv ~/.zshrc ~/.zshrc.removed.$(date +%Y%m%d_%H%M%S)
    print_success "Резервная копия создана"
fi

# 3. Restore bash config if backup exists
LATEST_BACKUP=$(ls -t ~/.zshrc.backup.* 2>/dev/null | head -1 || echo "")
if [[ -n "$LATEST_BACKUP" && -f "$LATEST_BACKUP" ]]; then
    print_status "Восстанавливаем последнюю резервную копию zsh..."
    print_warning "Найдена резервная копия: $LATEST_BACKUP"
    read -p "Восстановить её как ~/.zshrc? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        cp "$LATEST_BACKUP" ~/.zshrc
        print_success "Резервная копия восстановлена"
    fi
fi

# 4. Optional: Remove zsh-autosuggestions
echo ""
read -p "Удалить zsh-autosuggestions? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    if [[ -d ~/.zsh/zsh-autosuggestions ]]; then
        rm -rf ~/.zsh/zsh-autosuggestions
        print_success "zsh-autosuggestions удален"
    fi
    
    # Remove .zsh directory if empty
    if [[ -d ~/.zsh ]] && [[ -z "$(ls -A ~/.zsh)" ]]; then
        rmdir ~/.zsh
        print_success "Пустая директория ~/.zsh удалена"
    fi
fi

# 5. Optional: Uninstall zsh package
echo ""
read -p "Удалить пакет zsh полностью? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    print_warning "Это удалит zsh из системы полностью"
    sudo apt remove --purge zsh
    print_success "Пакет zsh удален"
fi

echo ""
echo "============================================================================="
print_success "🎉 ОТКАТ ЗАВЕРШЕН!"
echo "============================================================================="
echo ""
print_status "Что было сделано:"
echo "  ✅ Оболочка по умолчанию изменена на bash"
echo "  ✅ Конфигурация zsh сохранена в резервной копии"
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "  ✅ zsh-autosuggestions удален"
fi
echo ""
print_status "Для активации изменений:"
echo "  1. Перезагрузите компьютер, ИЛИ"
echo "  2. Выйдите и войдите в систему, ИЛИ"
echo "  3. Запустите: exec bash"
echo ""
print_status "Резервные копии сохранены в домашней директории"
echo "============================================================================="
