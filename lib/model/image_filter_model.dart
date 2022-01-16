class ImageFilterModel{
  int? page;
  String? quarry;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ImageFilterModel && o.page == page && o.quarry == quarry;
  }

  @override
  int get hashCode => page.hashCode ^ quarry.hashCode;

  @override
  String toString() => 'LazyLoadingFilter(page:$page,limit:$quarry)';
}