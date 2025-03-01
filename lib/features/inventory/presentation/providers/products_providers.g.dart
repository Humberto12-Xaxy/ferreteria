// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsCurrentFilterHash() =>
    r'80960a6962a0f5760001a1b650e4d298d32982e9';

/// See also [ProductsCurrentFilter].
@ProviderFor(ProductsCurrentFilter)
final productsCurrentFilterProvider =
    AutoDisposeNotifierProvider<ProductsCurrentFilter, FilterType>.internal(
  ProductsCurrentFilter.new,
  name: r'productsCurrentFilterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productsCurrentFilterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductsCurrentFilter = AutoDisposeNotifier<FilterType>;
String _$productsHash() => r'510833ffb2abc84890abcde76090c83dc135e4c8';

/// See also [Products].
@ProviderFor(Products)
final productsProvider =
    AutoDisposeAsyncNotifierProvider<Products, List<ProductEntity>>.internal(
  Products.new,
  name: r'productsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$productsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Products = AutoDisposeAsyncNotifier<List<ProductEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
