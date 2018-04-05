import React from 'react';
import { connect } from 'react-redux';
import { Button, FormGroup, Label, Input, FormFeedback, FormText } from 'reactstrap';
import api from '../api';

function TaskForm(props) {
    console.log("props@TaskForm", props);

    function update(ev) {
        let tgt = $(ev.target);

        let data = {};

        if (tgt.attr('name') === "completed") {
            data["completed"] = !(tgt.val().toString() === 'true');
        }
        else {
            data[tgt.attr('name')] = tgt.val();
        }

        let action = {
            type: 'UPDATE_FORM',
            data: data,
        };
        console.log(action);
        props.dispatch(action);
    }

    function submit(ev) {

        if (props.form.title.length === 0){
            $("#title_error").text("Please enter a title.");
            return
        } else {
            $("#title_error").text("");
        }

        if (props.form.description.length === 0){
            $("#description_error").text("Please enter a description.");
            return
        } else {
            $("#description_error").text("");
        }

        api.submit_task(props.form);
        console.log(props.form);
    }

    function clear(ev) {
        props.dispatch({
            type: 'CLEAR_FORM',
        });
    }

    function add_time(ev) {
        let time = parseInt(props.form.time_spent) + 15;

        let data = {time_spent: time};

        let action = {
            type: 'UPDATE_FORM',
            data: data,
        };
        props.dispatch(action);
    }

    function reduce_time(ev) {
        let time = parseInt(props.form.time_spent) - 15;

        if (time < 0) {time = 0}

        let data = {time_spent: time};

        let action = {
            type: 'UPDATE_FORM',
            data: data,
        };
        props.dispatch(action);
    }


    let users = _.map(props.users, (uu) => <option key={uu.id} value={uu.id}>{uu.name}</option>);

    if (props.token) {
        return <div style={{padding: "4ex"}}>
            <h2>New Task</h2>
            <FormGroup>
                <Label for="user_id">Assign to User</Label>
                <Input type="select" name="user_id" value={props.form.user_id} onChange={update}>
                    {users}
                </Input>
            </FormGroup>
            <FormGroup>
                <Label for="title">Title</Label>
                <Input name="title" value={props.form.title} onChange={update}/>
                <span id={"title_error"}></span>
            </FormGroup>
            <FormGroup>
                <Label for="description">Description</Label>
                <Input type="textarea" name="description" value={props.form.description} onChange={update}/>
                <span id={"description_error"}></span>
            </FormGroup>
            <FormGroup>
                <Label for="time_spent">How much time has been spent?</Label>
                <div className="row" style={{paddingLeft: "2ex"}}>
                    <p> {props.form.time_spent} minutes </p>&nbsp;&nbsp;&nbsp;&nbsp;
                    <Button onClick={add_time}>Add</Button>&nbsp;
                    <Button onClick={reduce_time}>Reduce</Button>
                </div>
            </FormGroup>
            <FormGroup check>
                <Label check>
                    <Input type="checkbox" name="completed" value={props.form.completed} onChange={update}/>{' '}
                    Check if completed.
                </Label>
            </FormGroup>
            <p></p>
            <Button onClick={submit} color="primary">Task</Button> &nbsp;
            <Button onClick={clear}>Clear</Button>
        </div>;
    } else {
        return <div style={{padding: "4ex"}}>
            <h2> Please log in. </h2>
        </div>
    }

}

function state2props(state) {
    console.log("rerender@TaskForm", state);
    return {
        form: state.form,
        users: state.users,
    };
}

export default connect(state2props)(TaskForm);