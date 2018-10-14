<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/nav.jsp"%>

<section>

	<div class="container"
		style="width: 100%; border: 2px solid black; padding: 0 10%;">
		<div class="contents"
			style="border: solid 1px black; height: 600px; float: left; width: 75%;">
			
			<img src="http://placehold.it/70x70" alt="..." class="img-circle">

			<p style="">식단</p>
			<div class="progress" style="margin:auto; width: 60%; style="float: left"">
				<div
					class="progress-bar progress-bar-success progress-bar-striped active"
					role="progressbar" aria-valuenow="5" aria-valuemin="0"
					aria-valuemax="100" style="min-width: 2em; width: 2%;">2%</div>
			</div>

			<p style="float: left">운동<p>
			<div class="progress" style="width: 60%;">
				<div class="progress-bar progress-bar-success" style="width: 35%">
					<span class="sr-only">35% Complete (success)</span>
				</div>
				<div class="progress-bar progress-bar-warning progress-bar-striped"
					style="width: 20%">
					<span class="sr-only">20% Complete (warning)</span>
				</div>
				<div class="progress-bar progress-bar-danger" style="width: 10%">
					<span class="sr-only">10% Complete (danger)</span>
				</div>
			</div>
			<p>아침</p>
			<p>점심</p>
			<p>저녁</p>
			<p>운동</p>
		</div>
		<div class="side"
			style="border: 1px solid green; height: 600px; float: right; width: 20%;">

		</div>
	</div>
</section>

