import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import 'rxjs/add/operator/map';

/*
  Generated class for the BeaconServiceProvider provider.

  See https://angular.io/docs/ts/latest/guide/dependency-injection.html
  for more info on providers and Angular 2 DI.
*/
@Injectable()
export class BeaconServiceProvider {

  beacon_data: any;


  beaconapi_Url = 'http://ec2-54-179-182-168.ap-southeast-1.compute.amazonaws.com/myapi/api/beacon';
 

  constructor(public http: Http) {
    console.log('Hello BeaconServiceProvider Provider');
  }

  getBeacons() {
      if (this.beacon_data) {
        return Promise.resolve(this.beacon_data);
      }

      return new Promise(resolve => {
        this.http.get(this.beaconapi_Url)
          .map(res => res.json())
          .subscribe(data => {
            this.beacon_data = data;
            resolve(this.beacon_data);
          });
      });
  } //end getBeacons


} //end class
