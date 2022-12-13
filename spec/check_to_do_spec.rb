require 'check_to_do'

RSpec.describe 'check_to_do method' do
    it 'text with correct hashtag returns true' do
        to_do_checked = check_to_do("This has the correct hashtag #TODO and should return true.")
        expect(to_do_checked).to eq true
    end

    it 'text with incorrect hashtag returns false' do
        to_do_checked = check_to_do("This has the wrong hashtag #todo and should return false.")
        expect(to_do_checked).to eq false
    end

    it 'text with no hashtag should return false' do
        to_do_checked = check_to_do("This has no hashtag and should return false.")
        expect(to_do_checked).to eq false
    end

    context 'when something other than a string has been entered' do
        it 'fails' do
            expect{ check_to_do(true) }.to raise_error 'Text only please!'
        end
    end
end