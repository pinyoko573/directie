import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import 'rxjs/add/operator/map';
import { AngularFireDatabase, FirebaseObjectObservable } from 'angularfire2/database';

import { Global } from '../../global';

import * as firebase from 'firebase';


/*
  Generated class for the DatabaseProvider provider.

  See https://angular.io/docs/ts/latest/guide/dependency-injection.html
  for more info on providers and Angular 2 DI.
*/
@Injectable()
export class DatabaseProvider {
  profile: FirebaseObjectObservable<any>
  imageName = "";
  constructor(public http: Http, private afDb: AngularFireDatabase, private global: Global) {
    console.log('Hello DatabaseProvider Provider');
  }

  getProfile(): FirebaseObjectObservable<any> {
    // console.log('getting userprofile');
    this.profile = this.afDb.object('/userProfile/' + this.global.userid);
    // console.dir(this.profile);

    return this.profile;
  }

  getUser(id): FirebaseObjectObservable<any> {
    return this.afDb.object('/userProfile/' + id);
  }

  updateProfile(name, url, gender, school) {
    return this.profile.update({
      name: name,
      image: url,
      gender: gender,
      school: school,
      imageName: this.imageName

    });
  }

  uploadImage(imageString, oldImage): Promise<any> {
    let image: string = 'profile-' + new Date().getTime() + '.jpg',
      storageRef: any,
      parseUpload: any;
    this.imageName = image;

    return new Promise((resolve, reject) => {
      firebase.storage().ref('images/' + oldImage).delete();
      storageRef = firebase.storage().ref('images/' + image);
      parseUpload = storageRef.putString(imageString, 'data_url');

      parseUpload.on('state_changed', (_snapshot) => {
        // We could log the progress here IF necessary
        // console.log('snapshot progess ' + _snapshot);
      },
        (_err) => {
          reject(_err);
        },
        (success) => {
          resolve(parseUpload.snapshot);
        });
    });
  }

  getComments(type, id) {
    this.afDb.list('/comments/exhibit/' + id) // Primary list
      .subscribe(items => {
        for (let item of items) {
          // Find each corresponding associated object and store it as a FibreaseObjectObservable
          this.afDb.object('/userProfile/' + item.user).subscribe(data => {
            console.dir(data);
            item.name = data.name;
            item.image = data.image;
          });
        }
        return items;
      });
  }

  getVisitors(request) {
    let facilityId = request.facilityId;
    let locationId = request.locationId;
    this.afDb.list('/log/' + locationId + '/facilities/' + facilityId).subscribe(items => {
      for (let item of items) {
        // Find each corresponding associated object and store it as a FibreaseObjectObservable
        this.afDb.object('/userProfile/' + item.$key).subscribe(data => {
          // console.dir(data);
          item.name = data.name;
          item.image = data.image;
        });
      }
      console.dir(items);
      return items;
    })
  }


  // getVisitors(units) {
  //   console.log('getVisitors');
  //   console.dir(units)
  //   let response = [];

  //   for (let unit of units) {
  //     console.log(unit)

  //     this.afDb.list('/log/units/' + unit)
  //       .subscribe(items => {
  //         for (let item of items) {
  //           console.log(item);
  //           this.afDb.object('/userProfile/' + item.$key).subscribe(data => {
  //             item.name = data.name;
  //             item.image = data.image;
  //           });
  //           // response.(item);
  //         };
  //         console.dir(items);
  //         // response.push(items);
  //         // return items;
  //       })

  //   }

  //   // setTimeout(() => {
  //   //   console.log('response');
  //   //   console.dir(response);
  //   // }, 1000)
  //   return response;
  // }

}
