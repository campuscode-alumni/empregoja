require 'rails_helper'

RSpec.describe Job, type: :model do

  describe "#recent?" do

    context "created today" do
      it "is recent" do
        job = create_job
        expect(job).to be_recent
      end
    end

    context "created 6 days ago" do
      it "is not recent" do
        job = nil
        travel_to 6.days.ago do
          job = create_job
        end
        expect(job).to_not be_recent
      end
    end

    context "created 4 days ago" do
      it "is recent" do
        job = nil
        travel_to 4.days.ago do
          job = create_job
        end
        expect(job).to be_recent
      end
    end

  end

end
