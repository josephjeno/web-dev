import React from 'react';
import ReactDOM from 'react-dom';
import { Provider, connect } from 'react-redux';
import { BrowserRouter as Router, Route } from 'react-router-dom';

import Navi from './nav.jsx';
import Feed from './feed';
import Users from './users';
import TaskForm from './task-form';
import UserForm from './new-user';

export default function tasktracker_init(store) {
    ReactDOM.render(
        <Provider store={store}>
            <TaskTracker state={store.getState()} />
        </Provider>,
        document.getElementById('root'),
    );
}

let TaskTracker = connect((state) => state)((props) => {

    return (
        <Router>
            <div>
                <Navi login={props.login} />
                <Route path="/" exact={true} render={() =>
                    <div>
                        <TaskForm token={props.token}/>
                        <Feed tasks={props.tasks} token={props.token} login={props.login}/>
                    </div>
                } />
                <Route path="/new-user" exact={true} render={() =>
                    <div>
                        <UserForm />
                    </div>
                } />
                <Route path="/users" exact={true} render={() =>
                    <Users users={props.users} />
                } />
                <Route path="/users/:user_id" render={({match}) =>
                    <Feed tasks={_.filter(props.tasks, (pp) =>
                        match.params.user_id == pp.user.id )
                    } login={props.login} token={props.token}/>
                } />
            </div>
        </Router>
    );
});