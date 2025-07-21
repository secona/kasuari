project(
    'kasuari-kernel',
    'c',
    default_options: ['c_std=gnu99', 'optimization=2', 'warning_level=3'],
    meson_version: '>=1.4.0',
)

linker_script = files('linker.ld')
sources = files('boot.s', 'kernel.c')

c_flags = ['-ffreestanding']
link_flags = ['-T', linker_script[0].full_path(), '-nostdlib', '-lgcc']

executable(
    'kasuari',
    sources,
    c_args: c_flags,
    link_args: link_flags,
    link_depends: linker_script,
)
