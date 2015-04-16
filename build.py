import sys
from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext
from Cython.Build import cythonize

ext_modules = []

names = [
    'pyspades.vxl',
    'pyspades.common',
]

for name in names:
    extra = {'extra_compile_args' : ['-std=c++11']} if name in ['pyspades.vxl'] else {}

    ext_modules.append(Extension(name, ['./%s.pyx' % name.replace('.', '/')],
        language = 'c++', include_dirs=['./pyspades'], **extra))


setup(
    name = 'pyspades extensions',
    ext_modules = cythonize(ext_modules)
)
