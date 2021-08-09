import { Injectable } from '@angular/core';
import 'rxjs/add/operator/map';
import { Http, Response, Headers, RequestOptions } from '@angular/http';
/*
  Generated class for the NearbyProvider provider.

  See https://angular.io/docs/ts/latest/guide/dependency-injection.html
  for more info on providers and Angular DI.
*/
@Injectable()
export class NearbyProvider {

  constructor(public http: Http) {
    console.log('Hello NearbyProvider Provider');
  }

  url = 'http://ec2-54-179-182-168.ap-southeast-1.compute.amazonaws.com/mapi/api/nearby/getbylevel/';

  getNearby(beaconid){
    // let headers = new Headers();
    // let options = new RequestOptions({ headers: headers });
    // return this.http.get('http://ec2-54-179-182-168.ap-southeast-1.compute.amazonaws.com/mapi/api/nearby/getbylevel/' + beaconid).toPromise();
return new Promise(resolve => {
        let url = this.url + beaconid;
        //console.log("Getting project info at: " + url)
        this.http.get(url)
          .map(res => res.json())
          .subscribe(data => {

            resolve(data);
            
          });
      });

}

}
