# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def proxy_wasm_cpp_host_repositories():
    http_archive(
        name = "proxy_wasm_cpp_sdk",
        sha256 = "c57de2425b5c61d7f630c5061e319b4557ae1f1c7526e5a51c33dc1299471b08",
        strip_prefix = "proxy-wasm-cpp-sdk-fd0be8405db25de0264bdb78fae3a82668c03782",
        urls = ["https://github.com/proxy-wasm/proxy-wasm-cpp-sdk/archive/fd0be8405db25de0264bdb78fae3a82668c03782.tar.gz"],
    )

    http_archive(
        name = "com_google_googletest",
        sha256 = "9dc9157a9a1551ec7a7e43daea9a694a0bb5fb8bec81235d8a1e6ef64c716dcb",
        strip_prefix = "googletest-release-1.10.0",
        urls = ["https://github.com/google/googletest/archive/release-1.10.0.tar.gz"],
    )

    http_archive(
        name = "com_google_protobuf",
        sha256 = "77ad26d3f65222fd96ccc18b055632b0bfedf295cb748b712a98ba1ac0b704b2",
        strip_prefix = "protobuf-3.17.3",
        url = "https://github.com/protocolbuffers/protobuf/releases/download/v3.17.3/protobuf-all-3.17.3.tar.gz",
    )

    http_archive(
        name = "com_github_bytecodealliance_wasm_micro_runtime",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wamr.BUILD",
        sha256 = "46ad365a1c0668797e69cb868574fd526cd8e26a503213caf782c39061e6d2e1",
        strip_prefix = "wasm-micro-runtime-17a216748574499bd3a5130e7e6a20b84fe76798",
        url = "https://github.com/bytecodealliance/wasm-micro-runtime/archive/17a216748574499bd3a5130e7e6a20b84fe76798.tar.gz",
    )

    native.bind(
        name = "wamr",
        actual = "@com_github_bytecodealliance_wasm_micro_runtime//:wamr_lib",
    )

    http_archive(
        name = "com_github_bytecodealliance_wasmtime",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wasmtime.BUILD",
        sha256 = "e95d274822ac72bf06355bdfbeddcacae60d7e98fec8ee4b2e21740636fb5c2c",
        strip_prefix = "wasmtime-0.26.0",
        url = "https://github.com/bytecodealliance/wasmtime/archive/v0.26.0.tar.gz",
    )

    http_archive(
        name = "com_github_webassembly_wasm_c_api",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wasm-c-api.BUILD",
        sha256 = "c774044f51431429e878bd1b9e2a4e38932f861f9211df72f75e9427eb6b8d32",
        strip_prefix = "wasm-c-api-c9d31284651b975f05ac27cee0bab1377560b87e",
        url = "https://github.com/WebAssembly/wasm-c-api/archive/c9d31284651b975f05ac27cee0bab1377560b87e.tar.gz",
    )

    native.bind(
        name = "wasmtime",
        actual = "@com_github_webassembly_wasm_c_api//:wasmtime_lib",
    )

    http_archive(
        name = "rules_rust",
        sha256 = "db182e96b5ed62b044142cdae096742fcfd1aa4febfe3af8afa3c0ee438a52a4",
        strip_prefix = "rules_rust-96d5118f03411f80182fd45426e259eedf809d7a",
        url = "https://github.com/bazelbuild/rules_rust/archive/96d5118f03411f80182fd45426e259eedf809d7a.tar.gz",
    )

    http_archive(
        name = "rules_foreign_cc",
        sha256 = "d54742ffbdc6924f222d2179f0e10e911c5c659c4ae74158e9fe827aad862ac6",
        strip_prefix = "rules_foreign_cc-0.2.0",
        url = "https://github.com/bazelbuild/rules_foreign_cc/archive/0.2.0.tar.gz",
    )

    http_archive(
        name = "llvm",
        build_file = "@proxy_wasm_cpp_host//bazel/external:llvm.BUILD",
        sha256 = "df83a44b3a9a71029049ec101fb0077ecbbdf5fe41e395215025779099a98fdf",
        strip_prefix = "llvm-10.0.0.src",
        url = "https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/llvm-10.0.0.src.tar.xz",
    )

    http_archive(
        name = "com_github_wavm_wavm",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wavm.BUILD",
        sha256 = "fa9a8dece0f1a51f8789c07f7f0c1f817ceee54c57d85f22ab958e43cde648d3",
        strip_prefix = "WAVM-93c3ad73e2938f19c8bb26d4f456b39d6bc4ca01",
        url = "https://github.com/WAVM/WAVM/archive/93c3ad73e2938f19c8bb26d4f456b39d6bc4ca01.tar.gz",
    )

    native.bind(
        name = "wavm",
        actual = "@com_github_wavm_wavm//:wavm_lib",
    )
