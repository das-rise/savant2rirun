.PHONY: install run clean

VENV_DIR := .venv
ORBIT_REPO := https://github.com/RI-SE/ORBIT
ORBIT_DIR := ORBIT

install:
	@echo "Creating virtual environment..."
	uv venv $(VENV_DIR)
	@echo "Installing dependencies..."
	uv pip install -e .
	@echo "Cloning ORBIT repository..."
	git clone $(ORBIT_REPO)
	@echo "Installing orbit-georef..."
	uv pip install -e $(ORBIT_DIR)/orbit-georef

clean:
	@echo "Cleaning up..."
	rm -rf $(VENV_DIR)
	rm -rf *.egg-info
	rm -rf $(ORBIT_DIR)

rebuild: clean install

help:
	@echo "Available targets:"
	@echo "  install  - Set up the virtual environment and install dependencies"
	@echo "  clean    - Remove the virtual environment and cloned ORBIT repository"
	@echo "  rebuild  - Clean and then install everything again"
	@echo "  help     - Show this help message"
