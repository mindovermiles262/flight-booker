require 'rails_helper'

RSpec.describe FlightsController, type: :controller do
  before do
    @flight1 = FactoryGirl.create(:flight)
    @flight2 = FactoryGirl.create(:flight)
    valid_params = { departure: @flight1.departure, 
                     arrival: @flight1.arrival,
                     date: @flight1.departure_time, 
                     passnegers: 2 }
  end

    let (:valid_params) {
      { 
        departing: @flight1.departure,
        arriving: @flight1.arrival,
        date: @flight1.departure_time,
        passengers: 2 
      }
    }

  describe 'GET #index' do
    context 'without parameters' do
      it 'renders flights#index' do
        get :index
        expect(response).to render_template :index
      end
      it 'displays deparutres array' do
        get :index
        expect(assigns(:departures)).to match_array([["Factory Airport", 1], ["Factory Airport", 3]])
      end
      it 'renders arrivals array' do
        get :index
        expect(assigns(:arrivals)).to match_array([["Factory Airport", 2], ["Factory Airport", 4]])
      end
      it 'renders date list' do
        get :index
        expect(assigns(:dates)).to match_array([@flight1.departure_time.strftime("%b %d %Y")])
      end
      it 'renders passengers array' do
        get :index
        expect(assigns(:passengers)).to match_array([1, 2, 3, 4])
      end
    end
    

    context 'with params' do
      it 'is valid' do
        get :index, :params => valid_params
        expect(response).to render_template :index
      end
    end
    it 'renders flight selection' do
      get :index, :params => valid_params
      expect(assigns(:flights)).to match_array([@flight1])
    end
  end

end
