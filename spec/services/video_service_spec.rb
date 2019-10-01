require 'rails_helper'

describe VideoService do

  before :each do
    @video = create(:video, status: :active)
  end

  describe '#call' do
    context "when video is start" do
      before(:each) do
        create(:user, video: @video)
        @video.reload
        @results = VideoService.new(@video).call
      end

      it "results is a hash" do
        expect(@results.class).to eq(Hash)
      end
  end
end
end
end