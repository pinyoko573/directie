import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import 'rxjs/add/operator/map';

/*
  Generated class for the MapServiceProvider provider.

  See https://angular.io/docs/ts/latest/guide/dependency-injection.html
  for more info on providers and Angular 2 DI.
*/
@Injectable()
export class MapServiceProvider {

  
  map_data: any;
  mapsapi_Url = 'http://ec2-54-179-182-168.ap-southeast-1.compute.amazonaws.com/myapi/api/Map/GetByMapId/';
  mapbeaconsapi_Url = 'http://ec2-54-179-182-168.ap-southeast-1.compute.amazonaws.com/mapi/api/beaconunit/GetByMapBeaconId/';


  constructor(public http: Http) {
    console.log('Hello MapServiceProvider Provider');
  } //end constructor

  getMapByMapId(mapid) {
      /*if (this.map_data) {
        return Promise.resolve(this.map_data);
      }*/

      

      return new Promise(resolve => {
        let url = this.mapsapi_Url + mapid;
        console.log("Getting map info at: " + url)
        this.http.get(url)
          .map(res => res.json())
          .subscribe(data => {
            this.map_data = data;
            var index = this.map_data.indexOf("id=svg");
            if (index==-1){
                index = "xmlns";
                this.map_data = "<svg id='svg' " + this.map_data.substring(index,this.map_data.length);
            } //end if
            
            resolve(this.map_data);
          });
      });
  } //end getBeaconWhere

  getMapByBeaconId(beaconid) {
     /* if (this.map_data) {
        return Promise.resolve(this.map_data);
      }*/


      return new Promise(resolve => {
        let url = this.mapbeaconsapi_Url + beaconid;
        console.log("Getting map info at: " + url)
        this.http.get(url)
          .map(res => res.json())
          .subscribe(data => {
            this.map_data = data;
            resolve(this.map_data);
          });
      });
  } //end getBeaconWhere


} //end class
