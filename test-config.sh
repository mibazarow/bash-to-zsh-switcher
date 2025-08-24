#!/bin/bash

# =============================================================================
# ZSH Configuration Tester
# =============================================================================
# Тестирование конфигурации zsh и autosuggestions
# 
# Использование: ./test-config.sh
# =============================================================================

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_test() {
    echo -e "${BLUE}[TEST]${NC} $1"
}

print_pass() {
    echo -e "${GREEN}[PASS]${NC} $1"
}

print_fail() {
    echo -e "${RED}[FAIL]${NC} $1"
}

print_info() {
    echo -e "${YELLOW}[INFO]${NC} $1"
}

echo "============================================================================="
echo "🧪 ZSH CONFIGURATION TESTER"
echo "============================================================================="
echo ""

# Test 1: Check if zsh is installed
print_test "Проверка установки zsh..."
if command -v zsh >/dev/null 2>&1; then
    ZSH_VERSION=$(zsh --version)
    print_pass "Zsh установлен: $ZSH_VERSION"
else
    print_fail "Zsh не установлен"
    exit 1
fi

# Test 2: Check default shell
print_test "Проверка оболочки по умолчанию..."
DEFAULT_SHELL=$(getent passwd $USER | cut -d: -f7)
if [[ "$DEFAULT_SHELL" == *"zsh"* ]]; then
    print_pass "Оболочка по умолчанию: $DEFAULT_SHELL"
else
    print_info "Оболочка по умолчанию: $DEFAULT_SHELL (не zsh)"
fi

# Test 3: Check current shell
print_test "Проверка текущей оболочки..."
if [[ "$SHELL" == *"zsh"* ]]; then
    print_pass "Текущая оболочка: $SHELL"
else
    print_info "Текущая оболочка: $SHELL (не zsh)"
fi

# Test 4: Check .zshrc exists
print_test "Проверка файла .zshrc..."
if [[ -f ~/.zshrc ]]; then
    print_pass "Файл ~/.zshrc существует"
    ZSHRC_SIZE=$(wc -l < ~/.zshrc)
    print_info "Размер конфигурации: $ZSHRC_SIZE строк"
else
    print_fail "Файл ~/.zshrc не найден"
fi

# Test 5: Check zsh-autosuggestions
print_test "Проверка zsh-autosuggestions..."
if [[ -d ~/.zsh/zsh-autosuggestions ]]; then
    print_pass "zsh-autosuggestions установлен"
    if [[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
        print_pass "Основной файл autosuggestions найден"
    else
        print_fail "Основной файл autosuggestions не найден"
    fi
else
    print_fail "zsh-autosuggestions не установлен"
fi

# Test 6: Check if autosuggestions is sourced in .zshrc
print_test "Проверка подключения autosuggestions в .zshrc..."
if [[ -f ~/.zshrc ]] && grep -q "zsh-autosuggestions" ~/.zshrc; then
    print_pass "autosuggestions подключен в .zshrc"
else
    print_fail "autosuggestions не подключен в .zshrc"
fi

# Test 7: Test zsh configuration load
print_test "Тестирование загрузки конфигурации zsh..."
if zsh -c "source ~/.zshrc" 2>/dev/null; then
    print_pass "Конфигурация zsh загружается без ошибок"
else
    print_fail "Ошибка при загрузке конфигурации zsh"
fi

# Test 8: Check essential development tools
echo ""
print_test "Проверка инструментов разработки в zsh..."

# Test Flutter
if zsh -c "source ~/.zshrc && command -v flutter" >/dev/null 2>&1; then
    FLUTTER_VERSION=$(zsh -c "source ~/.zshrc && flutter --version 2>/dev/null | head -1" || echo "Ошибка получения версии")
    print_pass "Flutter: $FLUTTER_VERSION"
else
    print_info "Flutter не найден в PATH"
fi

# Test Android SDK
if zsh -c "source ~/.zshrc && [[ -n \$ANDROID_HOME ]]" 2>/dev/null; then
    ANDROID_HOME_VALUE=$(zsh -c "source ~/.zshrc && echo \$ANDROID_HOME" 2>/dev/null)
    print_pass "Android SDK: $ANDROID_HOME_VALUE"
else
    print_info "ANDROID_HOME не установлен"
fi

# Test Git
if command -v git >/dev/null 2>&1; then
    GIT_VERSION=$(git --version)
    print_pass "Git: $GIT_VERSION"
else
    print_info "Git не установлен"
fi

# Test 9: Check aliases
echo ""
print_test "Проверка aliases..."
if zsh -c "source ~/.zshrc && alias ll" >/dev/null 2>&1; then
    print_pass "Alias 'll' работает"
else
    print_fail "Alias 'll' не найден"
fi

if zsh -c "source ~/.zshrc && alias gs" >/dev/null 2>&1; then
    print_pass "Git alias 'gs' работает"
else
    print_info "Git alias 'gs' не найден"
fi

# Test 10: Interactive test
echo ""
print_test "Интерактивный тест autosuggestions..."
echo "Для тестирования autosuggestions в интерактивном режиме:"
echo "1. Запустите: zsh"
echo "2. Начните вводить команду (например: 'fls' или 'gi')"
echo "3. Должны появиться серые подсказки"
echo "4. Нажмите → для принятия подсказки"

echo ""
echo "============================================================================="
echo "📊 РЕЗУЛЬТАТЫ ТЕСТИРОВАНИЯ"
echo "============================================================================="

# Summary
echo ""
if [[ -f ~/.zshrc ]] && [[ -d ~/.zsh/zsh-autosuggestions ]] && zsh -c "source ~/.zshrc" 2>/dev/null; then
    print_pass "✅ Основная конфигурация работает корректно"
    echo ""
    echo "🚀 Для запуска zsh выполните:"
    echo "   exec zsh"
    echo ""
    echo "📝 Или перезагрузите систему для автоматического использования zsh"
else
    print_fail "❌ Обнаружены проблемы в конфигурации"
    echo ""
    echo "🔧 Попробуйте переустановить:"
    echo "   ./install-zsh-autosuggestions.sh"
fi

echo "============================================================================="
