require 'rails_helper'

DATE = 90

RSpec.describe Job, type: :model do

  describe "#expired?" do

    context "after #{DATE - 1} days" do
      it "is not expired" do
        job = create_job
        travel_to (DATE - 1).days.from_now do
        end
        expect(job).not_to be_expired
      end
    end

    context "after #{DATE} days" do
      it "is expired" do
        job = create_job
        travel_to DATE.days.from_now do
        end
        expect(job).to be_expired
      end
    end

    context "after #{DATE + 1} days" do
      it "is expired" do
        job = create_job
        travel_to (DATE + 1).days.from_now do
        end
        expect(job).to be_expired
      end
    end

  end

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
