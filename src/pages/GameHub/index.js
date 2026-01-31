import React from 'react';
import { Link } from 'react-router-dom';
import './style.less';

class GameHub extends React.Component {
    getGameInfo = () => {
        const path = this.props.location?.pathname || '';
        const isDishonored2 = path.includes('dishonored-2');
        
        if (isDishonored2) {
            return {
                title: 'DISHONORED 2',
                subtitle: 'Take Back What\'s Yours',
                year: '2016',
                basePath: '/dishonored-2',
                number: '02'
            };
        }
        
        return {
            title: 'DISHONORED',
            subtitle: 'Revenge Solves Everything',
            year: '2012',
            basePath: '/dishonored',
            number: '01'
        };
    }

    render() {
        const game = this.getGameInfo();
        
        const categories = [
            {
                title: 'ПЕРСОНАЖИ',
                description: 'Герои и злодеи мира Dishonored',
                path: `${game.basePath}/characters`,
                number: '01'
            },
            {
                title: 'СПОСОБНОСТИ',
                description: 'Дары Аутсайдера и магические силы',
                path: `${game.basePath}/powers`,
                number: '02'
            },
            {
                title: 'ПРЕДМЕТЫ',
                description: 'Оружие, гаджеты и артефакты',
                path: `${game.basePath}/items`,
                number: '03'
            },
            {
                title: 'ЛОКАЦИИ',
                description: 'Города, здания и знаковые места',
                path: `${game.basePath}/locations`,
                number: '04'
            },
            {
                title: 'МЕХАНИКИ',
                description: 'Система хаоса, стелс и достижения',
                path: `${game.basePath}/mechanics`,
                number: '05'
            }
        ];

        const isDishonored2 = game.number === '02';

        return (
            <div className={`game-hub-container ${isDishonored2 ? 'dishonored2' : 'dishonored1'}`}>
                <Link to="/" className="back-button">
                    ← НАЗАД
                </Link>

                <div className="hub-header">
                    <div className="game-number">{game.number}</div>
                    <h1 className="game-title">{game.title}</h1>
                    <p className="game-subtitle">{game.subtitle}</p>
                    <div className="game-year">{game.year}</div>
                </div>

                <div className="categories-grid">
                    {categories.map((cat, index) => (
                        <Link 
                            to={cat.path} 
                            key={index}
                            className="category-card"
                        >
                            <div className="card-number">{cat.number}</div>
                            <h2 className="card-title">{cat.title}</h2>
                            <p className="card-description">{cat.description}</p>
                            <div className="card-hover-overlay"></div>
                        </Link>
                    ))}
                </div>
            </div>
        );
    }
}

export default GameHub;
