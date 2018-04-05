import { createStore, combineReducers } from 'redux';
import deepFreeze from 'deep-freeze';

/*
 *  state layout:
 *  {
 *   tasks: [... Tasks ...],
 *   users: [... Users ...],
 *   form: {
 *     user_id: null,
 *     title: "",
 *     description: "",
 *     time_spent: 0,
 *     completed: false,
 *     //body: "", DELETE
 *   }
 * }
 *
 * */

function tasks(state = [], action) {
    switch (action.type) {
        case 'TASKS_LIST':
            return [...action.tasks];
        case 'ADD_TASK':
            return [action.task, ...state];
        case 'EDIT_TASK':
            return [...action.tasks];
        case 'DELETE_TASK':
            return [...action.tasks];
        default:
            return state;
    }
}

function users(state = [], action) {
    switch (action.type) {
        case 'USERS_LIST':
            return [...action.users];
        case 'ADD_USER':
            return [action.user, ...state];
        case 'DELETE_USER':
            return [...action.users];
        default:
            return state;
    }
}

let empty_form = {
    user_id: "",
    title: "",
    description: "",
    time_spent: 0,
    completed: false,
    token: "",
};

function form(state = empty_form, action) {
    switch (action.type) {
        case 'UPDATE_FORM':
            return Object.assign({}, state, action.data);
        case 'CLEAR_FORM':
            return empty_form;
        case 'SET_TOKEN':
            return Object.assign({}, state, action.token);
        default:
            return state;
    }
}

function token(state = null, action) {
    switch (action.type) {
        case 'SET_TOKEN':
            return action.token;
        default:
            return state;
    }
}

let empty_user = {
    name: "",
    email: "",
    password: "",


};

function userform(state = empty_user, action) {
    switch (action.type) {
        case 'UPDATE_USER_FORM':
            return Object.assign({}, state, action.data);
        case 'CLEAR_USER_FORM':
            return empty_user;
        default:
            return state;
    }
}

let empty_login = {
    name: "",
    pass: "",
};

function login(state = empty_login, action) {
    switch (action.type) {
        case 'UPDATE_LOGIN_FORM':
            return Object.assign({}, state, action.data);
        default:
            return state;
    }
}

function root_reducer(state0, action) {
    console.log("reducer", action);
    // {tasks, users, form} is ES6 shorthand for
    // {tasks: tasks, users: users, form: form}
    let reducer = combineReducers({tasks, users, form, userform, token, login});
    let state1 = reducer(state0, action);
    console.log("state1", state1);
    return deepFreeze(state1);
};

let store = createStore(root_reducer);
export default store;