// preview.js

document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('topic_image')){
    const ImageList = document.getElementById("image-list");
    document.getElementById("topic_image").addEventListener("change",function(e){

      // 問題のremove記述
      const imageContents = document.querySelectorAll('img');
      const count = imageContents.length
      const imageContent = document.querySelector('#currentThumb');
      if (imageContent){
        for (let i = 0 ; i < count ; i++){
          const removeContent = document.querySelector('#currentThumb')
          removeContent.remove();
        };
      };
      const file = e.target.files;
      const num = file.length;
      
      for (let i = 0 ; i < num ; i++ ){
        const blob = window.URL.createObjectURL(file[i]);
        if (num > 4){
          alert("画像は4枚まで投稿できます。再度画像を選択しなおして下さい。")
          return false;
        }
        // 画像を表示するためのdiv要素を生成
        const imageElement = document.createElement('div');
        imageElement.setAttribute('class',"topic-preview");
        imageElement.id = "currentThumb"
        
        // 表示する画像を生成
        const blobImage = document.createElement('img');
        blobImage.setAttribute('src', blob);
        blobImage.height = 100;
        blobImage.width = 80;
        
        // 生成したHTMLの要素をブラウザに表示させる
        imageElement.appendChild(blobImage);
        ImageList.appendChild(imageElement);
      };
    });
  };
});