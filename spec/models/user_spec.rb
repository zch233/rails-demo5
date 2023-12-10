require 'rails_helper'

RSpec.describe User, type: :model do
  it '可以带密码创建' do
    user = User.create email: '1@qq.com', password: '123456', password_confirmation: '123456'
    expect(user.password_digest).to_not eq '123456'
    expect(user.id).to be_a Numeric
  end
  it '可以删除 user' do # 一般来说这个不需要测试，因为删除功能是 rails 做好的，不是你写的代码
    user = User.create email: '1@qq.com', password: '123456', password_confirmation: '123456'
    # expect(User.count).to eq 1
    # User.destroy_by id: user.id
    # expect(User.count).to eq 0
    # 等价于下面
    # expect {
    #   User.destroy_by id: user.id
    # }.to change { User.count }.from(1).to(0)
    expect {
      User.destroy_by id: user.id
    }.to change { User.count }.by(-1)
  end
  it '创建的时候必须有 email' do
    user = User.create password: '123456', password_confirmation: '123456'
    expect(user.errors.details[:email][0][:error]).to eq(:blank)
  end
  it '创建的时候 email 不能重复' do
    User.create email: '1@qq.com', password: '123456', password_confirmation: '123456'
    user = User.create email: '1@qq.com', password: '123456', password_confirmation: '123456'
    expect(user.errors.details[:email][0][:error]).to eq(:taken)
  end
  # it '创建之后会发送欢迎邮件' do
  #   x = spy('x')
  #   allow(User.after_create).to receive(:welcome_email)
  #   user = User.create email: '1@qq.com', password: '123456', password_confirmation: '123456'
  #   expect(UserMailer).to have_received(:welcome_email)
  #   # expect(x).to have_received :deliver_later
  # end
end
