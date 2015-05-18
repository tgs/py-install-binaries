from setuptools import setup


setup(
        name="super_test_app",
        zip_safe=False,
        version="0.0",
        author="Thom",
        py_modules=['testmod'],
        setup_requires=['install_binaries'],
        install_binaries=['my_program'],
)
