import React from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';
import './style.less';

class ItemsPage extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            gameTitle: this.props.match?.url.includes('dishonored-2') ? 'Dishonored 2' : 'Dishonored',
            gameType: this.props.match?.url.includes('dishonored-2') ? 'dishonored-2' : 'dishonored',
            selectedCategory: 'all',
            items: [],
            isLoaded: false
        };
    }

    componentDidMount() {
        this.getItems();
    }

    getItems = () => {
        const game = this.state.gameTitle;
        axios.get(`http://localhost:3001/api/getItemsData/game/${game}`)
            .then(res => {
                this.setState({
                    items: res.data.data,
                    isLoaded: true
                });
            })
            .catch(err => {
                console.log(err);
                this.setState({ isLoaded: true });
            });
    }

    handleCategoryChange = (category) => {
        this.setState({ selectedCategory: category });
    }

    getFilteredItems = () => {
        const { items, selectedCategory } = this.state;
        if (selectedCategory === 'all') return items;
        return items.filter(item => item.category === selectedCategory);
    }

    getCategoryLabel = (category) => {
        const labels = {
            'weapon': 'Оружие',
            'consumable': 'Расходники',
            'enhancement': 'Улучшения',
            'currency': 'Валюта'
        };
        return labels[category] || category;
    }

    getRarityLabel = (rarity) => {
        const labels = {
            'common': 'Обычный',
            'uncommon': 'Необычный',
            'rare': 'Редкий',
            'legendary': 'Легендарный'
        };
        return labels[rarity] || rarity;
    }

    render() {
        const { gameTitle, gameType, selectedCategory, isLoaded } = this.state;
        const filteredItems = this.getFilteredItems();
        const basePath = gameType === 'dishonored-2' ? '/dishonored-2' : '/dishonored';

        if (!isLoaded) {
            return (
                <div className="loading-screen">
                    <div className="loading-text">Загрузка предметов...</div>
                </div>
            );
        }
        
        return (
            <div className="items-page">
                <div className="page-background"></div>
                
                <div className="page-header">
                    <Link to={basePath} className="back-button">
                        <span className="back-icon">←</span>
                        <span>НАЗАД К ИГРЕ</span>
                    </Link>
                    <h1 className="page-title">ПРЕДМЕТЫ</h1>
                    <div className="game-badge">{gameTitle}</div>
                </div>

                <div className="category-filter">
                    <button 
                        className={`filter-btn ${selectedCategory === 'all' ? 'active' : ''}`}
                        onClick={() => this.handleCategoryChange('all')}
                    >
                        ВСЕ
                    </button>
                    <button 
                        className={`filter-btn ${selectedCategory === 'weapon' ? 'active' : ''}`}
                        onClick={() => this.handleCategoryChange('weapon')}
                    >
                        ОРУЖИЕ
                    </button>
                    <button 
                        className={`filter-btn ${selectedCategory === 'consumable' ? 'active' : ''}`}
                        onClick={() => this.handleCategoryChange('consumable')}
                    >
                        РАСХОДНИКИ
                    </button>
                    <button 
                        className={`filter-btn ${selectedCategory === 'enhancement' ? 'active' : ''}`}
                        onClick={() => this.handleCategoryChange('enhancement')}
                    >
                        УЛУЧШЕНИЯ
                    </button>
                </div>

                <div className="items-grid">
                    {filteredItems.map(item => (
                        <div key={item.id} className={`item-card rarity-${item.rarity}`}>
                            <div className="item-header">
                                <div className="rarity-badge">{this.getRarityLabel(item.rarity)}</div>
                                <div className="category-badge">{this.getCategoryLabel(item.category)}</div>
                            </div>
                            
                            <div className="item-content">
                                <h3 className="item-name">{item.title}</h3>
                                <p className="item-description">{item.description}</p>
                                
                                {item.effects && item.effects.length > 0 && (
                                    <div className="item-effects">
                                        <h4 className="effects-title">Эффекты:</h4>
                                        <ul className="effects-list">
                                            {item.effects.map((effect, idx) => (
                                                <li key={idx}>{effect}</li>
                                            ))}
                                        </ul>
                                    </div>
                                )}
                                
                                {item.location && (
                                    <div className="item-location">
                                        <span className="location-label">Местонахождение:</span> {item.location}
                                    </div>
                                )}
                            </div>
                            
                            <div className="item-shine"></div>
                        </div>
                    ))}
                </div>

                <div className="corner-ornament top-left"></div>
                <div className="corner-ornament top-right"></div>
                <div className="corner-ornament bottom-left"></div>
                <div className="corner-ornament bottom-right"></div>
            </div>
        );
    }
}

export default ItemsPage;
