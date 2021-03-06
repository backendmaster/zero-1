package=libsnark
$(package)_download_path=https://github.com/radix42/$(package)/archive/
$(package)_file_name=$(package)-$($(package)_git_commit).tar.gz
$(package)_download_file=$($(package)_git_commit).tar.gz
$(package)_sha256_hash=1f70df80b4852b5d55dc6e00af29e98f07b6758902d85a7814577e678296c005
$(package)_git_commit=4015f558bb7a1b603de4ee1559c974389d3abb54

$(package)_dependencies=libgmp libsodium

define $(package)_build_cmds
  CXX="x86_64-w64-mingw32-g++-posix" CXXFLAGS="-DBINARY_OUTPUT -DPTW32_STATIC_LIB -DSTATICLIB -DNO_PT_COMPRESSION=1 -fopenmp" $(MAKE) lib DEPINST=$(host_prefix) CURVE=ALT_BN128 MULTICORE=1 NO_PROCPS=1 NO_GTEST=1 NO_DOCS=1 STATIC=1 NO_SUPERCOP=1 FEATUREFLAGS=-DMONTGOMERY_OUTPUT OPTFLAGS="-O2 -march=x86-64"
endef

define $(package)_stage_cmds
  $(MAKE) install STATIC=1 DEPINST=$(host_prefix) PREFIX=$($(package)_staging_dir)$(host_prefix) CURVE=ALT_BN128 NO_SUPERCOP=1
endef
