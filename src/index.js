import '@babel/polyfill';
import ReactDOM from 'react-dom';
import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import router from './router';
import App from './App';
import './style/main.less';

class Root extends React.Component {
    render() {
        return (
            <Router>
                <App>
                    <Switch>
                        {router.map(({
                            path, exact, component: C
                        }) => (
                            <Route
                                key={path || 'notfound'}
                                path={path}
                                exact={exact}
                                component={C}
                            />
                        ))}
                    </Switch>
                </App>
            </Router>
        );
    }
}


if (!window.ssr) {
    ReactDOM.render(<Root />, document.getElementById('root'));
}
