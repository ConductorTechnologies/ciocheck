# ciocheck

A command-line tool for analyzing and validating image sequences. Easily check for missing frames, verify file sizes, and visualize sequence patterns.

## Installation

Install directly from PyPI:
```bash
pip install ciocheck
```

## Usage

Basic usage:
```bash
ciocheck "myfile[1-100####].png"
```

The pattern syntax supports:
- Frame ranges: `[1-100####]`
- Individual frames: `[1,5,10####]`
- Mixed specifications: `[1,5,10-20####]`

### Options

```bash
ciocheck --help
```

### Output Formats

1. **Summary** (default)
   ```bash
   ciocheck "myfile[1-100####].png"
   ```
   Shows basic statistics about the sequence including missing frames and file sizes.

2. **ASCII Chart**
   ```bash
   ciocheck "myfile[1-100####].png" --format ascii
   ```
   Displays a text-based visualization of file sizes.

3. **Bar Chart**
   ```bash
   ciocheck "myfile[1-100####].png" --format bar
   ```
   Opens an interactive bar chart visualization.

## Examples

Check a sequence of PNG files:
```bash
ciocheck "render[1-100####].png"
```

Analyze specific frames:
```bash
ciocheck "shot[1,5,10-20####].exr"
```

View as ASCII chart with custom width:
```bash
ciocheck "frame[1-50###].jpg" --format ascii --width 120
```

## Contributing

Contributions are welcome! Here's how you can help:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Run the tests (`poetry run pytest`)
5. Commit your changes (`git commit -m 'Add amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

### Development Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/conductorTechnologies/ciocheck.git
   cd ciocheck
   ```

2. Install Poetry if you haven't already:
   ```bash
   curl -sSL https://install.python-poetry.org | python3 -
   ```

3. Install dependencies:
   ```bash
   poetry install
   ```

4. Activate the virtual environment:
   ```bash
   poetry shell
   ```

### Running Tests

```bash
poetry run pytest
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Authors

- Julian Mann - Initial work - [Julian Mann](https://github.com/hoolymama)

