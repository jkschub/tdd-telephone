require "rspec"

class Task
    attr_accessor :title, :description, :status, :created_at

    def initialize(title, description, status="incomplete")
        @title = title
        @description = description
        @status = status
        @created_at = Time.now
    end
end

describe Task do
	let(:task) { task = Task.new("Walk the dog", "I'm walking the dog") }

	context "when initializing" do
		it "should have a title" do
			expect(task.title).to eq "Walk the dog"
		end

		it "should have a description" do
			expect(task.description).to eq "I'm walking the dog"
		end

		it "should have a status" do
			expect(task.status).to eq "incomplete"
		end

		it "should have a created_at timestamp" do
			expect(task.created_at).should be_a_kind_of(Time)
		end
	end

	context "method to mark as complete" do
		it "should set status to complete" do
			task.mark_as_complete!

			expect(task.status).to eq "complete"
		end
	end

	context "method to mark as incomplete" do
		it "should set status to incomplete" do
			task.mark_as_incomplete!

			expect(task.status).to eq "incomplete"
		end
	end

	context "method to check if complete" do
		it "should show the status is complete" do
			task.mark_as_complete!

			expect(task.complete?).to eq true
		end

		it "should show the status is incomplete" do
			task.mark_as_incomplete!

			expect(task.complete?).to eq false
		end
	end
end