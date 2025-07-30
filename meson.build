project(
    'kasuari-kernel',
    'c',
    version: '0.1.0',
    meson_version: '>=1.4.0',
    default_options: [
        'c_std=gnu99',
        'optimization=2',
        'warning_level=3',
    ],
)

option_host_arch = get_option('host_arch')
if option_host_arch == ''
    error('host_arch must be set for kernel build')
endif

c_flags = ['-ffreestanding']
cpp_flags = ['-D__is_kernel']
link_flags = ['-nostdlib', '-lgcc']

inc_dirs = include_directories('include')

arch_dir = join_paths('arch', option_host_arch)
arch_linker_script = files(join_paths(arch_dir, 'linker.ld'))

arch_src = files(
    arch_dir / 'boot.S',
    arch_dir / 'tty.c',
)

linker_script_link_arg = ['-T', arch_linker_script[0].full_path()]
linker_script_depend = [arch_linker_script]

kernel_src = files('kernel/kernel.c')

executable(
    'kasuari',
    kernel_src,
    arch_src,
    include_directories: inc_dirs,
    c_args: c_flags,
    cpp_args: cpp_flags,
    link_args: link_flags + linker_script_link_arg,
    link_depends: linker_script_depend,
)
