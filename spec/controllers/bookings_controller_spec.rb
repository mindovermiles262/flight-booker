require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  before do
    @flight = FactoryGirl.create(:flight)
    @passenger = FactoryGirl.create(:passenger)
    @valid_params = { 
      booking: {
        flight_id: @flight.id, 
        passengers_attributes: {
          "0" => { name: @passenger.name, email: @passenger.email }
        }
      }
    }
    @invalid_params = {
      booking: {
        flight_id: @flight.id,
        passengers_attributes: { "0" => { name: nil, email: @passenger.email } }
      }
    }
  end

  describe 'GET new_booking' do
    it 'creates new booking' do
      get :new, params: { passengers: 2 }
      expect(assigns(:booking)).to be_kind_of(Booking)
      expect(assigns(:booking).passengers.length).to eq(2)
    end
  end

  describe 'POST bookings' do
    context 'with valid params' do
      it 'creates booking' do
        post :create, :params => @valid_params
        expect(assigns(:booking)).to be_valid
      end
      it 'saves booking' do
        expect{post :create, params: @valid_params}.to change(Booking, :count).by(1)
      end
      it 'redirects on success' do
        post :create, :params => @valid_params
        expect(response).to redirect_to booking_path(assigns[:booking])
      end
    end
    
    context 'with invalid params' do 
      it 'does not save booking' do
        expect{post :create, params: @invalid_params}.to_not change(Booking, :count)
      end
      it 'flashes message' do
        post :create, :params => @invalid_params
        expect(flash[:danger]).to be_present
      end
      it 'renders new template' do
        post :create, :params => @invalid_params
        expect(response).to render_template(:new)
      end
    end 
  end
end