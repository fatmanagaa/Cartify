import '../../../domain/entities/response/comman/meta_data.dart';
import '../../model/response/category_brand/comman/meta_data_dto.dart';

extension MetaDataMapper on MetaDataDto {
  MetaData toMetaData() {
    return MetaData(
      currentPage: currentPage,
      numberOfPages: numberOfPages,
      limit: limit,
      nextPage: nextPage,
    );
  }
}
