import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions } from '@angular/http';
import 'rxjs/add/operator/map';

import * as jsonQuery from 'json-query';

/*
  Generated class for the EventProvider provider.

  See https://angular.io/docs/ts/latest/guide/dependency-injection.html
  for more info on providers and Angular DI.
*/
@Injectable()
export class EventProvider {

  constructor(public http: Http) {
    console.log('Hello EventProvider Provider');
    let headers = new Headers({ 'Content-Type': 'application/json', });
    let options = new RequestOptions({ headers: headers });
    this.http.get(this.url, options).toPromise().then(data => {
      this.data = data.json();
      console.dir(this.data);

    });
  }

  // getAllEvents() {
  //   let headers = new Headers({ 'Content-Type': 'application/json', });
  //   let options = new RequestOptions({ headers: headers });
  //   return this.http.get('http://ec2-54-179-182-168.ap-southeast-1.compute.amazonaws.com/mapi/api/Events', options).toPromise();
  // }
  url = 'http://ec2-54-179-182-168.ap-southeast-1.compute.amazonaws.com/mapi/api/Events'
  data: any
  getAllEvents() {

    return new Promise(resolve => {

      if (this.data) {
        resolve(this.data.events);
      } else {


        console.log('from server');


        let headers = new Headers({ 'Content-Type': 'application/json', });
        let options = new RequestOptions({ headers: headers });
        this.http.get(this.url, options).toPromise().then(data => {
          this.data = data.json();
          console.dir(this.data);

          resolve(this.data.events);
        });
      }
    })

  }

  getOneEvent(eventId) {
    let eventData = jsonQuery('events[eventId=' + eventId + ']', {
      data: this.data
    }).value;
    console.dir(eventData);
    return eventData;
  }

  getExhibits(eventId) {
    let exhibits = jsonQuery('exhibits[*eventId=' + eventId + ']', {
      data: this.data
    }).value;
    return exhibits;
  }
}
