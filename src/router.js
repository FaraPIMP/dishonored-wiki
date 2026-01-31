import React from 'react';
import MainPage from './pages/Main/index';
import GameHub from './pages/GameHub/index';
import CharactersPage from './pages/Characters/index';
import CharacterDetailPage from './pages/CharacterDetail/index';
import PowersPage from './pages/Powers/index';
import ItemsPage from './pages/Items/index';
import LocationsPage from './pages/Locations/index';
import MechanicsPage from './pages/Mechanics/index';

const NotFoundPage = (props) => {
    return (
        <div className="error-page">
            <h2>404 - Страница не найдена</h2>
            <p>The Outsider didn't mark this path...</p>
            <p>Tried to access: {props.location?.pathname}</p>
        </div>
    );
};

const routes = [
    {
        path: `/`,
        exact: true,
        title: `Главная`,
        component: MainPage
    },
    {
        path: `/dishonored`,
        exact: true,
        title: `Dishonored`,
        component: GameHub
    },
    {
        path: `/dishonored-2`,
        exact: true,
        title: `Dishonored 2`,
        component: GameHub
    },
    {
        path: `/dishonored/characters/:id`,
        exact: true,
        title: `Персонаж`,
        component: CharacterDetailPage
    },
    {
        path: `/dishonored-2/characters/:id`,
        exact: true,
        title: `Персонаж`,
        component: CharacterDetailPage
    },
    {
        path: `/dishonored/characters`,
        exact: true,
        title: `Персонажи`,
        component: CharactersPage
    },
    {
        path: `/dishonored-2/characters`,
        exact: true,
        title: `Персонажи`,
        component: CharactersPage
    },
    {
        path: `/dishonored/powers`,
        exact: true,
        title: `Способности`,
        component: PowersPage
    },
    {
        path: `/dishonored-2/powers`,
        exact: true,
        title: `Способности`,
        component: PowersPage
    },
    {
        path: `/dishonored/items`,
        exact: true,
        title: `Предметы`,
        component: ItemsPage
    },
    {
        path: `/dishonored-2/items`,
        exact: true,
        title: `Предметы`,
        component: ItemsPage
    },
    {
        path: `/dishonored/locations`,
        exact: true,
        title: `Локации`,
        component: LocationsPage
    },
    {
        path: `/dishonored-2/locations`,
        exact: true,
        title: `Локации`,
        component: LocationsPage
    },
    {
        path: `/dishonored/mechanics`,
        exact: true,
        title: `Механики`,
        component: MechanicsPage
    },
    {
        path: `/dishonored-2/mechanics`,
        exact: true,
        title: `Механики`,
        component: MechanicsPage
    },
    {
        component: NotFoundPage
    }
];

export default routes;

