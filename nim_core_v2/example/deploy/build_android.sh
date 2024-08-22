# Copyright (c) 2022 NetEase, Inc. All rights reserved.
# Use of this source code is governed by a MIT license that can be
# found in the LICENSE file.

set -e
set +x

echo "Build android start"

project_path=$1
archive_root_path=$2
archive_director_name=$3
archive_name=$4
build_type=$5

flutter clean
flutter pub upgrade
flutter build apk --release


rm -rf "${archive_root_path}/android"
output_path_app="${archive_root_path}/android/${archive_director_name}"
mkdir -p "${output_path_app}"
echo ">>>>>output_path_app:$output_path_app"


#指定输出apk名称
apk_path="${output_path_app}/${archive_name}.apk"
echo ">>>>>apk_path:$apk_path"
pwd
cp build/app/outputs/apk/release/app-release.apk  ${apk_path}


echo "Build android done"

set +e
