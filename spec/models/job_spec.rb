require 'rails_helper'

RSpec.describe Job, type: :model do

  describe "#expired?" do

    context "after 89 days" do
      it "is not expired" do
        job = create_job
        travel_to 89.days.from_now do
          expect(job).not_to be_expired
        end
      end
    end

    context "after 90 days" do
      it "is expired" do
        job = create_job
        travel_to 90.days.from_now do
          expect(job).to be_expired
        end
      end
    end

    context "after 91 days" do
      it "is expired" do
        job = create_job
        travel_to 91.days.from_now do
          expect(job).to be_expired
        end
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
