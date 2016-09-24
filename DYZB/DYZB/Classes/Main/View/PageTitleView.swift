//
//  PageTitleView.swift
//  DYZB
//
//  Created by michael on 16/9/21.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

protocol PageTitleViewDelegate : class {
    func pageTitleView(titleView : PageTitleView, selectedIndex index : Int)
}

private let kScrollLineH : CGFloat = 2

class PageTitleView: UIView {
    
    //MARK:- 定义属性
    public var currentIndex : Int = 0
    public var titles : [String]
    weak var delegate : PageTitleViewDelegate?

    //MARK:- 懒加载属性
    public lazy var titleLabels : [UILabel] = [UILabel]()
    public lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    
    public lazy var scrollLine : UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    
    //MARK:- 自定义构造函数
    init(frame: CGRect, titles : [String]) {
        self.titles = titles
        
        super.init(frame : frame)
        
        //设置UI界面
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK:-设置UI界面
extension PageTitleView{
    public func setupUI(){
        //1.添加UIScrollView
        addSubview(scrollView)
        scrollView.frame = bounds
        
        //2.添加title对应的Label
        setupTitleLabels()
        
        //3.设置底线和滚动的滑块
        setupBottomMenuAndScrollLine()
    }
    
    private func setupTitleLabels(){
        
        //0.确定label的一些frame值
        let labelW : CGFloat = frame.width / CGFloat(titles.count)
        let labelH : CGFloat = frame.height - kScrollLineH
        let labelY : CGFloat = 0
        
        for (index, title) in titles.enumerated() {
            //1.创建UILabel
            let label = UILabel()
            
            //2.设置label的属性
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
            
            //3.设置label的frame
            let labelX : CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            //4.将Label添加到scrollView中
            scrollView.addSubview(label)
            titleLabels.append(label)
            
            //5.给Label添加手势
            label.isUserInteractionEnabled = true
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(self.titleLabelClick(tagGes:)))
            label.addGestureRecognizer(tapGes)
        }
    }
    
    private func setupBottomMenuAndScrollLine(){
        //1.添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH : CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        
        //2.添加scrollLine
        //2.1获取第一个Label
        guard let firstLabel = titleLabels.first else{ return }
        firstLabel.textColor = UIColor.orange
        
        //2.2设置scrollView的属性
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
    }
}

//MARK:- 监听Label的点击
extension PageTitleView{
    @objc public func titleLabelClick(tagGes : UITapGestureRecognizer){
        //1.获取当前Label的下标志
        guard let currentLabel = tagGes.view as? UILabel else{ return }
        
        //2.获取之前的Label
        let oldLabel = titleLabels[currentIndex]
        
        //3.切换文字颜色
        currentLabel.textColor = UIColor.orange
        oldLabel.textColor = UIColor.darkGray
        
        //4.保存最新Label的下标值
        currentIndex = currentLabel.tag
        
        //5.滚动条位置发生改变
        let scrollLinePositionX = CGFloat(currentLabel.tag) * scrollLine.frame.width
        UIView.animate(withDuration: 0.15) { 
            self.scrollLine.frame.origin.x = scrollLinePositionX
        }
        
        //6.通知代理
        delegate?.pageTitleView(titleView: self, selectedIndex: currentIndex)
    }
}

//MARK:- 对外暴露的方法
extension PageTitleView{
    func setTitleWithProgress(progress : CGFloat, sourceIndex : Int, targetIndex : Int){
        
    }
}



