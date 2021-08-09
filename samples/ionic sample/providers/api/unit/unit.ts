import { Injectable } from '@angular/core';
import 'rxjs/add/operator/map';
import { Http, Response, Headers, RequestOptions } from '@angular/http';

/*
  Generated class for the UnitProvider provider.

  See https://angular.io/docs/ts/latest/guide/dependency-injection.html
  for more info on providers and Angular 2 DI.
*/
@Injectable()
export class UnitProvider {

  constructor(public http: Http) {
    console.log('Hello UnitProvider Provider');
  }

  getUnit(unitNo : string){
    unitNo = unitNo.replace('-2', "");
    let headers = new Headers();
    let options = new RequestOptions({ headers: headers });
    return this.http.get('http://ec2-54-179-182-168.ap-southeast-1.compute.amazonaws.com/mapi/api/units/' + unitNo).toPromise();
  }
}
