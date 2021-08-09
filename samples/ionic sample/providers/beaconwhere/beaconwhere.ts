import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import 'rxjs/add/operator/map';

/*
  Generated class for the BeaconwhereProvider provider.

  See https://angular.io/docs/ts/latest/guide/dependency-injection.html
  for more info on providers and Angular 2 DI.
*/
@Injectable()
export class BeaconwhereProvider {
  
  beaconUnit: any;
  beaconUnitUrl = 'http://ec2-54-179-182-168.ap-southeast-1.compute.amazonaws.com/mapi/api/BeaconUnit/GetByBeaconId/';

  constructor(public http: Http) {
    console.log('Hello BeaconwhereProvider Provider');
  } //enc constructor

  getBeaconWhereByBeaconId(beaconid) {
     /* if (this.beaconwhere_data) {
        return Promise.resolve(this.beaconwhere_data);
      }*/

      return new Promise(resolve => {
        let url = this.beaconUnitUrl + beaconid;
        console.log("Getting beacon info at: " + url)
        this.http.get(url)
          .map(res => res.json())
          .subscribe(data => {
            this.beaconUnit = data;
            resolve(this.beaconUnit);
            
          });
      });
  } //end getBeaconWhere

} //end class
