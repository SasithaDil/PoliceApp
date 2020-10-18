class  Data {

  String _time;
  String _area;

  Data(this._time,this._area);

  String toParams() =>  "?time=$_time&area=$_area ";



}