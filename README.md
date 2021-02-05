# instagramStorySharePractice-iOS
:zap: instagram 스토리 공유기능 구현을 목표

### 개요
>- Android 암시적 인텐트 및 iOS 맞춤 URL 스키마를 사용하면 앱에서 사진, 동영상과 스티커를 Instagram 앱으로 보낼 수 있습니다.
>- Instagram 앱이 해당 콘텐츠를 받아서 스토리 작성기에 읽어들이면 사용자는 콘텐츠를 Instagram 스토리에 게시할 수 있습니다.
- Instagram 앱의 스토리 작성기는 배경 레이어와 스티커 레이어로 구성됩니다.
<img src="https://user-images.githubusercontent.com/69136340/106865995-4386a500-670f-11eb-851b-8d200ae48aab.png" width="300">

- 배경 레이어
  > 배경 레이어는 화면을 채우며 사진, 동영상, 단색 또는 컬러 그래디언트로 맞춤 설정할 수 있습니다.
- 스티커 레이어
  > 스티커 레이어는 이미지를 포함할 수 있으며, 사용자가 스토리 작성기에서 레이어를 추가로 맞춤 설정할 수 있습니다.

### Instagram의 맞춤 URL 스키마를 허용 리스트에 등록
- 앱에서 Instagram의 맞춤 URL 스키마를 사용하려면 허용 리스트에 추가해야 합니다. 이를 위해서는 앱의 Info.plist에 있는 LSApplicationQueriesSchemes 키에 instagram-stories를 추가합니다.
<img src ="https://user-images.githubusercontent.com/69136340/106881464-ed226200-6720-11eb-8126-d381773aa0e1.png" width="700">

## 완성
<p>
<img src = "https://user-images.githubusercontent.com/69136340/106991726-2b1f9480-67ba-11eb-896f-dc54529b9504.png" width="300">
<img src = "https://user-images.githubusercontent.com/69136340/106991729-2bb82b00-67ba-11eb-953d-88f4826eb001.png" width="300">
<img src = "https://user-images.githubusercontent.com/69136340/106991732-2ce95800-67ba-11eb-9c31-f6e4590be40d.png" width="300">
</p>

## 출처
- instagram story share : https://developers.facebook.com/docs/instagram/sharing-to-stories
