import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import 'rxjs/add/operator/map';

/*
  Generated class for the FacilityProvider provider.

  See https://angular.io/docs/ts/latest/guide/dependency-injection.html
  for more info on providers and Angular DI.
*/
@Injectable()
export class FacilityProvider {

url = 'http://ec2-54-179-182-168.ap-southeast-1.compute.amazonaws.com/mapi/api/facilities/';
  constructor(public http: Http) {
    console.log('Hello FacilityProvider Provider');
  }

  getFacility(id) {

    return new Promise(resolve => {
      let url = this.url + id;
      //console.log("Getting project info at: " + url)
      this.http.get(url)
        .map(res => res.json())
        .subscribe(data => {
          // this.data = data;
          resolve(data);

        });
    });
  } //end getProjectByProjectId()
}
