import * as firebase from 'firebase';
import 'firebase/firestore';
import config from '../../firebase.json';
import { _handleDeleteToDoPress } from '../ModifyToDo';

const app = firebase.initializeApp(config);

const Auth = app.auth();

export const login = async ({ email, password }) => {
  const { user } = await Auth.signInWithEmailAndPassword(email, password);
  return user;
};

const uploadImage = async uri => {
  const blob = await new Promise((resolve, reject) => {
    const xhr = new XMLHttpRequest();
    xhr.onload = function () {
      resolve(xhr.response);
    };
    xhr.onerror = function (e) {
      reject(new TypeError('Network request failed'));
    };
    xhr.responseType = 'blob';
    xhr.open('GET', uri, true);
    xhr.send(null);
  });

  const user = Auth.currentUser;
  const ref = app.storage().ref(`/profile/${user.uid}/photo.png`);
  const snapshot = await ref.put(blob, { contentType: 'image/png' });

  blob.close();
  return await snapshot.ref.getDownloadURL();
};

export const signup = async ({ email, password, name, photoUrl }) => {
  const { user } = await Auth.createUserWithEmailAndPassword(email, password);
  const storageUrl = photoUrl.startsWith('https')
    ? photoUrl
    : await uploadImage(photoUrl);
  await user.updateProfile({
    displayName: name,
    photoURL: storageUrl,
  });
  return user;
};

export const logout = async () => {
  return await Auth.signOut();
};

export const getCurrentUser = () => {
  const { uid, displayName, email, photoURL } = Auth.currentUser;
  return { uid, name: displayName, email, photoUrl: photoURL };
};

export const updateUserPhoto = async photoUrl => {
  const user = Auth.currentUser;
  const storageUrl = photoUrl.startsWith('https')
    ? photoUrl
    : await uploadImage(photoUrl);
  await user.updateProfile({ photoURL: storageUrl });
  return { name: user.displayName, email: user.email, photoUrl: user.photoURL };
};

/*export const updateTodo = 간지나게숨쉬기 => {
  const user = Auth.currentUser;
  const storageUrl = photoUrl.startsWith('https')
    ? photoUrl
    : await uploadImage(photoUrl);
  await user.updateProfile({ photoURL: storageUrl });
  return { name: user.displayName, email: user.email, photoUrl: user.photoURL };
};*/

export const DB = firebase.firestore();

export const createTodo = async ({Start, End, Cate, ToDo, Flag })=>{//, Flag Flag,
  const date = new Date();
 // const doDate = (date.getFullYear()).toString()+'-'+(date.getMonth()).toString()+'-'+(date.getDate()).toString();
  const newTodoRef = DB.collection('Todo').doc();
  const id = newTodoRef.id;
  const newTodo = {
    id,
    Start,
    End,
    Cate,
    ToDo,
    Flag,
  };
  await newTodoRef.set(newTodo);
  return id;
}


export const createTodaySignText = async({date,TodaySignText,TrafficSignData,PicSign})=>{
  //const date = new Date();
  //const doDate =(date.getFullYear()).toString()+'-'+(date.getMonth()).toString()+'-'+(date.getDate()).toString();
  const newSignRef = DB.collection('TodaySign').doc(date);
  const id = newSignRef.id;
  const newSign = {
    
    id,
    TodaySignText,
    TrafficSignData,
    PicSign , 
    createdAt: Date.now(), 

  };
 // TrafficSign : "1",
  // console.log("create"+TrafficSign+ "|"+picSign);
  
  await newSignRef.set(newSign);
  return id;
}

export const createCategory = async({label,value})=>{
  const newCateRef = DB.collection('Cate').doc();
  const newCate = {
    label,
    value,
  };
  
  await newCateRef.set(newCate);
}


export const createChannel = async ({ title, description }) => {
  const newChannelRef = DB.collection('channels').doc();
  const id = newChannelRef.id;
  const newChannel = {
    id,
    title,
    description,
    createdAt: Date.now(),
  };
  await newChannelRef.set(newChannel);
  return id;
};

export const createMessage = async ({ channelId, message }) => {
  return await DB.collection('channels')
    .doc(channelId)
    .collection('messages')
    .doc(message._id)
    .set({
      ...message,
      createdAt: Date.now(),
    });
};

export function getTodoRef({간지나게숨쉬기}){ 
  const TodoRef = DB.collection('Todo').doc(간지나게숨쉬기);
  const doc = TodoRef.get();

  return doc;
}
  
export function getTodaySign(){
  const date = new Date();
  const doDate =(date.getFullYear()).toString()+'-'+(date.getMonth()).toString()+'-'+(date.getDate()).toString();
  const signRef = DB.collection('TodaySign').doc(doDate);
  const doc = signRef.get();


  doc.then(function(doc){
    if(!doc.exists){
      console.log('No such document!');
    } else {
      console.log('doc Document data:', doc.data() );
     return doc.data()
    }
  });
}


export function getTodaySignRef({date}){

  // const date = new Date();
 // const doDate =(date.getFullYear()).toString()+'_'+(date.getMonth()).toString()+'_'+(date.getDate()).toString();
  const signRef = DB.collection('TodaySign').doc(date);
  const doc = signRef.get();
 
  return doc;


}


const TodoRef = DB.collection('Todo')    

// //0. 모든 카테고리 불러오기
// TodoRef.get().then((snapshot)=>{
//   snapshot.forEach((doc)=>{
//       console.log("0. get all items:", doc.data());
//   });
// })

// //1. 미완료/완료된 일만 뜨기
// TodoRef.where('Flag','==','false').orderBy('End','asc').get().then((snapshot)=>{
//   snapshot.forEach((doc)=>{
//       console.log("1. where flagFalse ordeBy End asc:", doc.data());
//   });
// })

// //2. 카테고리 별 투두 반환(한 카테고리 내) - 종료 일자 빠른 순
// TodoRef.where('Cate','==','School').orderBy('End','asc').get().then((snapshot)=>{
//   snapshot.forEach((doc)=>{
//       console.log("3. by cate End:", doc.data());
//   });
// })

// //3. 카테고리 별 투두 반환(한 카테고리 내) - 생성 일자 순
// TodoRef.where('Cate','==','School').orderBy('Start','asc').get().then((snapshot)=>{
//   snapshot.forEach((doc)=>{
//       console.log("4. by cate start:", doc.data());
//   });
// })


// //2. 투두 수정 (해당 투두 id 받기)
// TodoRef.doc('aiE9w5JrWr35YgrMIrmr').update({
//   Cate: 'Club',
//   End:1607110465663,
//   Flag: false,
//   Start:1607110465663,
//   ToDo:'update todo test'
// })
export function updateToDo({id,cate,end,start,todo,flag }){
  console.log("1flag=>",flag, id);
  TodoRef.doc(id).update({
  Cate: cate,
  End:end,
  Flag: flag,
  Start:start,
  ToDo: todo,
  })


  TodoRef.doc(id).get().then(function(doc){
  if(!doc.exists){
    console.log('No such document!');
  } else {
    console.log('doc Document data:', doc.data() );
    const data =doc.data();
    return data
  }
  });

}

//3. 투두 삭제(해당 투두 id 받기)

export function deletedTodo({id}){
  const deleted = TodoRef.doc(id)
   if(deleted == null){
     console.log('no such document exist!');
   }else{
    deleted.delete();
     console.log('well deleted');
   }
}

// //3. 투두 삭제(해당 투두 id 받기)
// const deleted = TodoRef.doc('rBITGTShVkAQimuNwyq9');
// if(deleted == null){
//   console.log('no such document exist!');
// }else{
//   deleted.delete();
//   console.log('well deleted');
// }

// //투두 반환(전체) - 종료 일자 빠른 순
//       TodoRef.orderBy('End','desc').get().then((snapshot)=>{
//           snapshot.forEach((doc)=>{
//               console.log("1. entire return orderby End:", doc.data());
//           });
//       })

// //투두 반환(전체) - 생성 일자 순 빠른 순(지금은 시작 일자 빠른 순임)
//       TodoRef.orderBy('Start','asc').get().then((snapshot)=>{
//         snapshot.forEach((doc)=>{
//             console.log("2. entire return orderby Start:", doc.data());
//         });
//     })


    
// //특정 아이템 검색 (전체, prefix search) elastic nono
//       TodoRef.where('ToDo','>=','s').where('ToDo','<=','s'+'\uf8ff').get().then((snapshot)=>{
//         snapshot.forEach((doc)=>{
//             console.log("5. search:", doc.data());
//         });
//     })