
class gridWidth{


 double aspectRatio({double width,int count,int height=120}){


    var _crossAxisSpacing = 8;
    var _screenWidth = 0.0;
    var _width = ( width - ((count - 1) * _crossAxisSpacing)) / count;
    var _aspectRatio = _width /height;


return _aspectRatio;


  }





}