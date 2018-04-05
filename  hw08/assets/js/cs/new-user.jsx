import React from 'react';
import { connect } from 'react-redux';
import { NavLink } from 'react-router-dom';
import { Form, Button, FormGroup, Label, Input , NavItem} from 'reactstrap';
import api from '../api';

function UserForm(props) {

    function update(ev) {
        let tgt = $(ev.target);
        let data = {};
        data[tgt.attr('name')] = tgt.val();
        let action = {
            type: 'UPDATE_USER_FORM',
            data: data,
        };
        props.dispatch(action);
    }

    function submit(ev) {

        if (props.userform.name.length === 0){
            $("#name_error").text("Please enter a name.");
            return
        } else {
            $("#name_error").text("");
        }
        if (props.userform.email.length === 0){
            $("#email_error").text("Please enter an email.");
            return
        } else {
            $("#email_error").text("");
        }
        if (props.userform.password.length === 0){
            $("#pass_error").text("Please enter a password.");
            return
        } else {
            $("#password_error").text("");
        }
        api.submit_user(props.userform);
        document.location = "../";
    }

    return (
    <div style={{padding: "4ex"}}>
        <h2>New User</h2>
        <FormGroup>
            <Label for="name">User Name</Label>
            <Input name="name" value={props.userform.name} onChange={update}/>
            <span id={"name_error"}></span>
        </FormGroup>
        <FormGroup>
            <Label for="email">Email</Label>
            <Input name="email" value={props.userform.email} onChange={update}/>
            <span id={"email_error"}></span>
        </FormGroup>
        <FormGroup>
            <Label for="pass">Password</Label>
            <Input type="password" name="password" value={props.userform.password} onChange={update}/>
            <span id={"password_error"}></span>
        </FormGroup>
        <Button onClick={submit} color="primary">Submit</Button>
    </div>);
}

function state2props(state) {

    return {
        userform: state.userform,
        users: state.users,
    };
}

export default connect(state2props)(UserForm);