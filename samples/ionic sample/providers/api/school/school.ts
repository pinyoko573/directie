import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions } from '@angular/http';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';
import { Global } from '../../../global';

/*
  Generated class for the ApiSchoolProvider provider.

  See https://angular.io/docs/ts/latest/guide/dependency-injection.html
  for more info on providers and Angular DI.
*/
@Injectable()
export class SchoolProvider {

  constructor(public http: Http, private global: Global) {
    console.log('Hello ApiSchoolProvider Provider');
  }

  getSchool(){
    let headers = new Headers({'Content-Type' : 'application/json',});
    let options = new RequestOptions({ headers: headers });
    // let schools = this.http.get('http://ec2-54-179-182-168.ap-southeast-1.compute.amazonaws.com/mapi/api/Schools', options).toPromise();
    // schools.then(data => {
    //   console.dir(data);
    //   console.dir(data.json()[0].name)
    // })
    return this.http.get('http://ec2-54-179-182-168.ap-southeast-1.compute.amazonaws.com/mapi/api/Schools', options).toPromise();
  }

}
